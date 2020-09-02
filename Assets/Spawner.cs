using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spawner : MonoBehaviour
{
    public GameObject helmet;
    public Quaternion helmRotation;

    GameObject instance;

    private void Awake()
    {
        transform.rotation = helmRotation;

        instance = Instantiate(helmet, transform);
        instance.transform.localScale = new Vector3(0.005f, 0.005f, 0.005f);
        instance.transform.parent = transform;
        instance.transform.localPosition = Vector3.zero;
    }

    private void Update()
    {
        transform.rotation = helmRotation;
    }
}
