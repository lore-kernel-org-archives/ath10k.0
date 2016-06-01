Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b828n-0004W5-OF
 for ath10k@lists.infradead.org; Wed, 01 Jun 2016 09:08:45 +0000
Date: Wed, 1 Jun 2016 14:38:05 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Fix 10.4 extended peer stats update
Message-ID: <20160601090805.GA7773@atheros-ThinkPad-T61>
References: <1464339926-12136-1-git-send-email-mohammed@qca.qualcomm.com>
 <87vb1ucten.fsf@qca.qualcomm.com>
 <20160531133700.GB3146@atheros-ThinkPad-T61>
 <87r3cicaxi.fsf@qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r3cicaxi.fsf@qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

Hello,

On Tue, May 31, 2016 at 06:57:52PM +0000, Valo, Kalle wrote:
> Mohammed Shafi Shajakhan <mohammed@codeaurora.org> writes:
> 
> >> > +void ath10k_sta_update_rx_duration(struct ath10k *ar,
> >> > +				   struct ath10k_fw_stats *stats)
> >> > +{
> >> > +	struct ath10k_fw_file *fw_file = &ar->normal_mode_fw.fw_file;
> >> > +
> >> > +	if (fw_file->wmi_op_version < ATH10K_FW_WMI_OP_VERSION_10_4)
> >> > +		ath10k_sta_update_stats_rx_duration(ar, &stats->peers);
> >> > +	else
> >> > +		ath10k_sta_update_extd_stats_rx_duration(ar,
> >> > +							 &stats->peers_extd);
> >> > +}
> >> 
> >> _Ideally_ wmi_op_version should be used only in ath10k_wmi_attach() and
> >> nowhere else. Isn't there any other way to detect this scenario? For
> >> example, what if you store stats_id to struct ath10k_fw_stats and do
> >> something like this:
> >> 
> >> if (stats->stats_id & WMI_10_4_STAT_PEER_EXTD)
> >> 	ath10k_sta_update_extd_stats_rx_duration(ar,
> >> 						 &stats->peers_extd);
> >> else
> >> 	ath10k_sta_update_stats_rx_duration(ar, &stats->peers);
> >> 
> >> Would that work?
> >
> > [shafi] I am also thinking to re-use (ar->fw_stats_req_mask & WMI_10_4_STAT_PEER_EXTD)
> > it might work, but will it conflict vdev stats WMI_STAT_VDEV (though its not currently
> > supported for 10.2 )
> 
> Can you describe more how they conflict?

[shafi] 'WMI_STAT_VDEV' and 'WMI_10_4_STAT_PEER_EXTD' are having the same value
BIT(3), though as of now we are only 'WMI_10_4_STAT_PEER_EXTD' for 10.4

> 
> > let me know your thoughts about this, seems extended stats was
> > implemented for 10.4 wmi version so i made it explicit
> 
> I don't like hard coding features like this based on wmi_op_version as
> that might create problems managing the firmware interfaces in the
> future. The simplest is if we can automatically runtime detect if
> firmware uses the extended version or not.
>
[shafi] Sure i come up with something else to address this in v3.

regards
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
