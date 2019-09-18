<#import "/spring.ftl" as spring />
<#if isBelowRenewThresold>
    <#if !registry.selfPreservationModeEnabled>
        <h4 id="" class="uptime_a">续期比门槛低，自保模式被撤销，这可能无法保护网络/其他问题的情况下失效。</h4>
    <#else>
        <h4 id="" class="uptime_a">紧急情况！尤里卡可能不正确地声称，当他们不在时，情况就上升了。更新比阈值小，因此，为了安全起见，实例不会过期。</h4>
    </#if>
<#elseif !registry.selfPreservationModeEnabled>
        <h4 id="" class="uptime_a">自保模式被撤销，这可能无法保护网络/其他问题的情况下失效。</h4>
</#if>

<h4><font size="+1" color="#1494ff">系统状态 <font size="-5">System Status</font></font></h4>
<div class="row">
  <div class="col-md-6">
      <div class="col_md">
        <table id='instances' class="table table-condensed table-striped table-hover table_T">
          <#if amazonInfo??>
            <tr>
              <td>EUREKA SERVER</td>
              <td>AMI: ${amiId!}</td>
            </tr>
            <tr>
              <td>可用区域</td>
              <td>${availabilityZone!}</td>
            </tr>
            <tr>
              <td>实例标识</td>
              <td>${instanceId!}</td>
            </tr>
          </#if>
          <tr>
            <td>环境</td>
            <td>${environment!}</td>
          </tr>
          <tr>
            <td>数据中心</td>
            <td>${datacenter!}</td>
          </tr>
        </table>
      </div>
  </div>
  <div class="col-md-6">
    <table id='instances' class="table table-condensed table-striped table-hover">
      <tr>
        <td>当前时间</td>
        <td>${currentTime}</td>
      </tr>
      <tr>
        <td>启动时间</td>
        <td>${upTime}</td>
      </tr>
      <tr>
        <td>启用租约到期时间</td>
        <td>${registry.leaseExpirationEnabled?c}</td>
      </tr>
      <tr>
        <td>更新阈值</td>
        <td>${registry.numOfRenewsPerMinThreshold}</td>
      </tr>
      <tr>
        <td>最后一分钟更新</td>
        <td>${registry.numOfRenewsInLastMin}</td>
      </tr>
    </table>
  </div>
</div>

<h4><font size="+1" color="#1494ff">服务副本 <font size="-5">DS Replicas</font></font></h4>
<ul class="list-group">
  <#list replicas as replica>
    <li class="list-group-item"><a href="${replica.value}">${replica.key}</a></li>
  </#list>
</ul>

