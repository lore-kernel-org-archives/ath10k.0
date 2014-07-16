Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7QL5-00006C-Vb
 for ath10k@lists.infradead.org; Wed, 16 Jul 2014 14:37:48 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [RFC 2/2] ath10k: add spectral scan feature
Date: Wed, 16 Jul 2014 16:35:41 +0200
Message-ID: <3551054.tVFpeBPdYt@bentobox>
In-Reply-To: <CA+BoTQm1i2UoTtPBf7Z3QLQDBs_1uXwdG8gYOkP556+a7AqcpQ@mail.gmail.com>
References: <1405441966-32681-1-git-send-email-sw@simonwunderlich.de>
 <1405441966-32681-3-git-send-email-sw@simonwunderlich.de>
 <CA+BoTQm1i2UoTtPBf7Z3QLQDBs_1uXwdG8gYOkP556+a7AqcpQ@mail.gmail.com>
MIME-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Mathias Kretschmer <mathias.kretschmer@fokus.fraunhofer.de>, "Giori,
 Kathy" <kgiori@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Simon Wunderlich <sw@simonwunderlich.de>

On Wednesday 16 July 2014 11:30:12 Michal Kazior wrote:
> > +static void ath_debug_send_fft_sample(struct ath10k *ar,
> > +                                     struct fft_sample_tlv
> > *fft_sample_tlv) +{
> 
> Why ath_debug_... instead of ath10k_debug_.. ?
> 
> 
> [...]

Will be modified.

> 
> > +static int ath_get_spectral_vdevid(struct ath10k *ar)
> 
> ath_get_..? Shouldn't this be ath10k_get?
> 
> > +{
> > +       struct ath10k_vif *arvif;
> > +
> > +       if (list_empty(&ar->arvifs))
> > +               return -ENODEV;
> > +
> > +       arvif = list_first_entry(&ar->arvifs, typeof(*arvif), list);
> > +       return arvif->vdev_id;
> > +}
> 
> No locks? Access to arvifs must be protected with conf_mutex.

Will be handled by the caller and lockdep_assert will be added to this 
function

> 
> What happens when an interface is removed without spectral scan being
> stopped?

This is a question for the QCA firmware guys.

> > +int ath10k_spectral_scan_config(struct ath10k *ar, enum spectral_mode
> > mode) +{
> > +       int count, ret;
> 
> We tend to use `res` in ath10k.

Thanks, will be changed. But actually, I found a lot of ret stuff in the 
ath10k code.

[...]
> + ath10k_warn("failed to configure spectral scan: %d\n", ret);
[...]
> "failed to parse phyerr tlv header at byte %d\n", i
[...]
> "failed to parse phyerr tlv payload at byte %d\n", i
[...]
> "failed to parse fft report at byte %d\n", i
[...]
> + ath10k_warn("failed to process fft report: %d\n", res)

Ok, warning messages will be modified.

> > +int ath10k_vdev_spectral_configure(struct ath10k *ar,
> > +                             const struct wmi_vdev_spectral_configure_arg
> > *arg)
> ath10k_wmi_vdev_spectral_configure
[...]
> > +int ath10k_vdev_spectral_enable(struct ath10k *ar, u32 vdev_id, u32
> > trigger, +                               u32 enable)
> 
> ath10k_wmi_vdev_spectral_enable

Ok, will be renamed.

> [...]
> > +struct wmi_vdev_spectral_configure_arg {
> > +       u32 vdev_id;
> > +       u32 scan_count;
> > +       u32 scan_period;
> > +       u32 scan_priority;
> > +       u32 scan_fft_size;
> > +       u32 scan_gc_ena;
> > +       u32 scan_restart_ena;
> > +       u32 scan_noise_floor_ref;
> > +       u32 scan_init_delay;
> > +       u32 scan_nb_tone_thr;
> > +       u32 scan_str_bin_thr;
> > +       u32 scan_wb_rpt_mode;
> > +       u32 scan_rssi_rpt_mode;
> > +       u32 scan_rssi_thr;
> > +       u32 scan_pwr_format;
> > +       u32 scan_rpt_mode;
> > +       u32 scan_bin_scale;
> > +       u32 scan_dBm_adj;
> > +       u32 scan_chn_mask;
> 
> Some stuff isn't self-explanatory. I'd love to see some of these
> fields documented to account for possible values (wb_rpt_mode?) and
> units (init_delay?).

Sorry, I got no documentation to anything. So I cannot provide one to you. 
Maybe you can get it easier than me.

> [...]
> 
> > +struct fft_sample_ath10k_ht20 {
> > +       struct fft_sample_tlv tlv;
> > +       u8 mhz;
> 
> A more suitable name would be "chan_width_mhz" I guess?

Ok,

> > +       __be16 freq1;
> > +       __be16 freq2;
> > +       __be16 noise;
> > +       __be16 max_magnitude;
> > +       __be16 total_gain_db;
> > +       __be16 base_pwr_db;
> > +       __be64 tsf;
> > +       s8 max_index;
> > +       u8 rssi;
> > +       u8 relpwr_db;
> > +       u8 avgpwr_db;
> > +
> > +       u8 data[SPECTRAL_ATH10K_HT20_NUM_BINS];
> 
> And as pointed out the size/count of bins is most likely not
> bandwidth-dependant. It's just a matter of resolution configured with
> fft_size + bin_scale. Maybe this should be a variable-sized array?

Ok, bin_scale didn't make a difference in my tests (I've just repeated them). 
But 2 ** (fft_size - 1) seems to be relevant. We have to change the format 
accordingly.

But currently we don't see any change in the bandwidth (20MHz/40MHz) for the 
different bin numbers. This has to be checked later in detail.

Kind regards,
	Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
