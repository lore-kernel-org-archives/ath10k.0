Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9ANu-0001aX-Ah
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 09:59:55 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: [PATCH 2/2] ath10k: add spectral scan feature
Date: Mon, 21 Jul 2014 11:59:25 +0200
References: <1405689992-8538-1-git-send-email-sw@simonwunderlich.de>
 <1405689992-8538-3-git-send-email-sw@simonwunderlich.de>
 <CA+BoTQmrn0ddGe=p_d9+vCpMUMQ6dKhL+DmZ76OicacmxoYVMA@mail.gmail.com>
In-Reply-To: <CA+BoTQmrn0ddGe=p_d9+vCpMUMQ6dKhL+DmZ76OicacmxoYVMA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201407211159.26103.sw@simonwunderlich.de>
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
 Kathy" <kgiori@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Sven Eckelmann <sven@narfation.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hey Michal,

thanks for the review! I agree to most points and will fixed them in the next 
revision, for the rest I'm putting comments below:

[...]
> > +       nf_list1 = __le32_to_cpu(event->hdr.nf_list_1);
> > +       nf_list2 = __le32_to_cpu(event->hdr.nf_list_2);
> > +       chain_idx = MS(reg0, SEARCH_FFT_REPORT_REG0_FFT_CHN_IDX);
> > +       switch (chain_idx) {
> > +       case 0:
> > +               fft_sample->noise = __cpu_to_be16(nf_list1 & 0xffffu);
> 
> Are you sure you want to & nf_list1 itself *before* the byte swap? You
> probably won't see a difference with an intel host system which is
> little-endian just like the target device.

That is intended as written: with le32_to_cpu() above we get the data into 
host order to process it, then we get the 16-bit noise values according to the 
chain index, and finally convert it to big endian as this is our exchange 
format to userspace - as you can see, we do the same for the other 16bit 
members of fft_sample as well.

[...]
> > +       arvif = ath10k_get_spectral_vdev(ar);
> > +       if (!arvif)
> > +               return -ENODEV;
> > +       vdev_id = arvif->vdev_id;
> > +
> > +       if (ar->spectral_mode == SPECTRAL_DISABLED)
> > +               return 0;
> > +
> > +       res = ath10k_wmi_vdev_spectral_enable(ar, vdev_id,
> > +                                            
> > WMI_SPECTRAL_TRIGGER_CMD_CLEAR, +                                       
> >      WMI_SPECTRAL_ENABLE_CMD_ENABLE); +       if (res < 0)
> > +               return res;
> > +
> > +       res = ath10k_wmi_vdev_spectral_enable(ar, vdev_id,
> > +                                            
> > WMI_SPECTRAL_TRIGGER_CMD_TRIGGER, +                                     
> >        WMI_SPECTRAL_ENABLE_CMD_ENABLE); +       if (res < 0)
> > +               return res;
> > +
> > +       return 0;
> > +}
> > +static int ath10k_spectral_scan_config(struct ath10k *ar,
> > +                                      enum ath10k_spectral_mode mode)
> > +{
> > +       struct wmi_vdev_spectral_conf_arg arg;
> > +       struct ath10k_vif *arvif;
> > +       int vdev_id, count, res = 0;
> > +
> 
> Ditto. lockdep_assert_held().

Actually both functions are calling ath10k_get_spectral_vdev() which already 
has that assert, but it doesn't hurt to put it here as well. Will do. :)
[...]

> 
> Did you test this against a firmware crash while spectral scan is
> enabled? ar->spectral_mode will be left as-is when restart is
> performed but no spectral scan will be actually configured. You either
> need to restart spectral scan (better from user perspective) or clear
> out the old mode (easier to code, but bad from user perspective
> because suddenly spectral scan would be stopped implicitly by device
> crash).

No, I didn't test that against a firmware crash yet ... Restarting spectral 
would probably a good idea in endless mode, but not if "count" has been set. 
I'll look into that and propose something in the next iteration.

Thanks. :)
    Simon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
