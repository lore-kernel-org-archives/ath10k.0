Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGsis-0004zS-4A
 for ath10k@lists.infradead.org; Sat, 25 Jun 2016 18:54:30 +0000
Date: Sun, 26 Jun 2016 00:23:50 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: Fix sending NULL/ Qos NULL data frames for
 QCA99X0 and later
Message-ID: <20160625185350.GA25330@atheros-ThinkPad-T61>
References: <1466700001-4883-1-git-send-email-mohammed@qca.qualcomm.com>
 <1466700001-4883-2-git-send-email-mohammed@qca.qualcomm.com>
 <576C1861.7020402@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <576C1861.7020402@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Hello Ben,

On Thu, Jun 23, 2016 at 10:12:01AM -0700, Ben Greear wrote:
> On 06/23/2016 09:40 AM, Mohammed Shafi Shajakhan wrote:
> >From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> >For chipsets like QCA99X0, IPQ4019 and later we are not getting proper
> >NULL func status (always acked/successs !!) when hostapd does a
> >PROBE_CLIENT via nullfunc frames when the station is powered off
> >abruptly (inactive timer probes client via null func after the inactive
> >time reaches beyond the threshold). Fix this by disabling the workaround
> >(getting the ACK status of NULL func frames by sending via HTT mgmt-tx
> >  path) introduced by the change ("ath10k: fix beacon loss handling ")
> >for QCA99X0 and later chipsets. The normal tx path provides the proper
> >ACK status for NULL data frames. As of now disable this workaround for
> >chipsets QCA99X0 and later, once the 10.1 firmware is obselete we can
> >completely get rid of this workaround for all the chipsets
> 
> Did you see my fix for the tx-status that Kalle posted about recently?
> That fixed my problem with 9980, but I normally test status with tx over
> the htt mgt path instead of wmi path, so possibly that makes a difference.

[shafi] Yes Kalle suggested to try your change (BTW we were not aware that you
already discovered this problem !!), https://patchwork.kernel.org/patch/8460831/
but ..


"[ 747.803652] ath10k_pci 0000:01:00.0: htt tx completion msdu_id 0 discard 0
no_ack 0 success 1"

"[ 747.803843] ath10k_pci 0001:01:00.0: htt tx completion msdu_id 0 discard 0
no_ack 0 success 1"

to be more precise looks like we hit this path for MSG type 0xE,( management Tx
completion indication) path(status ok ??) for null func frame without ACK

case HTT_MGMT_TX_STATUS_OK:
	tx_done.status = HTT_TX_COMPL_STATE_ACK;
	break;


a) The success bit being 'set' without the fix so the change you had mentioned may not help
for the upstreamed f/w, should we  give a shot with your change as well to
confirm it ?

b) and also the workaround is for older firmware which got fixed in
10.2.4 and 10.4, if you can help us that 10.1 also reports NULL func frame
status properly via normal data path, we can probably get rid of this workaround
once and for all ? thoughts ?

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
