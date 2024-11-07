# shardingsphere-proxy-etcd-test

- For https://github.com/apache/shardingsphere/issues/33565 .

## 1

- Verified using `Docker Engine` under `Ubuntu 22.04.4 LTS`. Reserve port 13308 on the host.

```shell
git clone git@github.com:linghengqian/shardingsphere-proxy-etcd-test.git
cd ./shardingsphere-proxy-etcd-test/
docker compose up -d
docker compose logs --follow shardingsphere-proxy-custom-etcd
```

- The log is as follows,

```shell
$ docker compose logs --follow shardingsphere-proxy-custom-etcd
shardingsphere-proxy-custom-etcd-1  | we find java version: java21, full_version=21.0.4, full_path=/opt/java/openjdk/bin/java
shardingsphere-proxy-custom-etcd-1  | unadapted java version, please notice...
shardingsphere-proxy-custom-etcd-1  | The port is 3308
shardingsphere-proxy-custom-etcd-1  | The classpath is /opt/shardingsphere-proxy/conf:.:/opt/shardingsphere-proxy/lib/*:/opt/shardingsphere-proxy/ext-lib/*
shardingsphere-proxy-custom-etcd-1  | main class org.apache.shardingsphere.proxy.Bootstrap 3308 /opt/shardingsphere-proxy/conf 0.0.0.0 false
shardingsphere-proxy-custom-etcd-1  | [INFO ] 2024-11-07 09:00:35.476 [main] i.v.c.spi.resolver.ResolverProvider - Using the default address resolver as the dns resolver could not be loaded
shardingsphere-proxy-custom-etcd-1  | [ERROR] 2024-11-07 09:00:41.107 [main] o.a.s.d.p.c.l.PipelineContextManagerLifecycleListener - Dispatch enable pipeline job start event failed
shardingsphere-proxy-custom-etcd-1  | java.lang.IllegalArgumentException: Unsupported cluster type: etcd
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$RegistryCenterHolder.lambda$createRegistryCenter$0(PipelineAPIFactory.java:150)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.infra.exception.core.ShardingSpherePreconditions.checkState(ShardingSpherePreconditions.java:44)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$RegistryCenterHolder.createRegistryCenter(PipelineAPIFactory.java:150)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$RegistryCenterHolder.<init>(PipelineAPIFactory.java:141)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$RegistryCenterHolder.lambda$getInstance$1(PipelineAPIFactory.java:155)
shardingsphere-proxy-custom-etcd-1  |   at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1708)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$RegistryCenterHolder.getInstance(PipelineAPIFactory.java:155)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory.getRegistryCenter(PipelineAPIFactory.java:109)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$ElasticJobAPIHolder.<init>(PipelineAPIFactory.java:123)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$ElasticJobAPIHolder.lambda$getInstance$0(PipelineAPIFactory.java:130)
shardingsphere-proxy-custom-etcd-1  |   at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1708)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory$ElasticJobAPIHolder.getInstance(PipelineAPIFactory.java:130)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.job.api.PipelineAPIFactory.getJobConfigurationAPI(PipelineAPIFactory.java:89)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.listener.PipelineContextManagerLifecycleListener.dispatchEnablePipelineJobStartEvent(PipelineContextManagerLifecycleListener.java:74)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.data.pipeline.core.listener.PipelineContextManagerLifecycleListener.onInitialized(PipelineContextManagerLifecycleListener.java:65)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.mode.manager.ContextManager.<init>(ContextManager.java:75)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.mode.manager.cluster.ClusterContextManagerBuilder.build(ClusterContextManagerBuilder.java:64)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.proxy.initializer.BootstrapInitializer.createContextManager(BootstrapInitializer.java:62)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.proxy.initializer.BootstrapInitializer.init(BootstrapInitializer.java:53)
shardingsphere-proxy-custom-etcd-1  |   at org.apache.shardingsphere.proxy.Bootstrap.main(Bootstrap.java:64)
shardingsphere-proxy-custom-etcd-1  | [WARN ] 2024-11-07 09:00:41.108 [main] o.a.s.s.c.j.s.c.StatisticsCollectJobWorker - Can not collect statistics because of unsupported cluster type: etcd
shardingsphere-proxy-custom-etcd-1  | [INFO ] 2024-11-07 09:00:41.202 [main] o.a.s.p.frontend.ssl.ProxySSLContext - Proxy frontend SSL/TLS is not enabled.
shardingsphere-proxy-custom-etcd-1  | [INFO ] 2024-11-07 09:00:41.226 [main] o.a.s.p.frontend.ShardingSphereProxy - ShardingSphere-Proxy Cluster mode started successfully
```

## 2

- In any external database tool like `IntelliJ IDEA`,
  connect to `jdbc:postgresql://localhost:13308/postgres` using username `root` and password `root`.
  Execute the following command,
```sql
CREATE DATABASE sharding_db;
```
