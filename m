Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bG8Gw-0003HN-26
 for ath10k@lists.infradead.org; Thu, 23 Jun 2016 17:18:35 +0000
Message-ID: <576C1861.7020402@candelatech.com>
Date: Thu, 23 Jun 2016 10:12:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: Fix sending NULL/ Qos NULL data frames for
 QCA99X0 and later
References: <1466700001-4883-1-git-send-email-mohammed@qca.qualcomm.com>
 <1466700001-4883-2-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1466700001-4883-2-git-send-email-mohammed@qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: mohammed@codeaurora.org, Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org

On 06/23/2016 09:40 AM, Mohammed Shafi Shajakhan wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> For chipsets like QCA99X0, IPQ4019 and later we are not getting proper
> NULL func status (always acked/successs !!) when hostapd does a
> PROBE_CLIENT via nullfunc frames when the station is powered off
> abruptly (inactive timer probes client via null func after the inactive
> time reaches beyond the threshold). Fix this by disabling the workaround
> (getting the ACK status of NULL func frames by sending via HTT mgmt-tx
>   path) introduced by the change ("ath10k: fix beacon loss handling ")
> for QCA99X0 and later chipsets. The normal tx path provides the proper
> ACK status for NULL data frames. As of now disable this workaround for
> chipsets QCA99X0 and later, once the 10.1 firmware is obselete we can
> completely get rid of this workaround for all the chipsets

Did you see my fix for the tx-status that Kalle posted about recently?
That fixed my problem with 9980, but I normally test status with tx over
the htt mgt path instead of wmi path, so possibly that makes a difference.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
