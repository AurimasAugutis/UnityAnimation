using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttachHelmet : MonoBehaviour
{
    public GameObject helmet;
    public GameObject hand;
    public GameObject head;

    public Vector3 offsetHead;

    public Vector3 handOffset = new Vector3(-18.3f, 225.1f, 27f);

    public void AttachToHand()
    {
        Debug.Log("here");
        helmet.transform.parent = hand.transform;
        //helmet.transform.localPosition = handOffset;
    }

    public void AttchedToHead()
    {
        helmet.transform.parent = head.transform;
        helmet.transform.localPosition = new Vector3(0f, -41.7f, -13.9f);
    }
}
