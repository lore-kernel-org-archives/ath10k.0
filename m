Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqj5K-00035R-0J
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 18:35:26 +0000
Received: by mail-ed1-x541.google.com with SMTP id b3so791482ede.1
 for <ath10k@lists.infradead.org>; Mon, 04 Feb 2019 10:33:19 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42])
 by smtp.gmail.com with ESMTPSA id s3sm4488816edm.31.2019.02.04.10.32.33
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Feb 2019 10:32:34 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id h50so759819ede.5
 for <ath10k@lists.infradead.org>; Mon, 04 Feb 2019 10:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20190114153558.972-1-chunkeey@gmail.com>
 <87tvhjd0c7.fsf@kamboji.qca.qualcomm.com>
 <4891660.4ehrp1WKpm@debian64>
In-Reply-To: <4891660.4ehrp1WKpm@debian64>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 4 Feb 2019 10:32:21 -0800
Message-ID: <CA+ASDXP5KFmsUXuOC2WfgBQX4VGAT7dqCHUTmPguxgeveYU5tA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: implement set_base_macaddr to fix rx-bssid mask
 in multiple APs conf
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
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mathias Kresin <dev@kresin.me>, Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>

On Mon, Feb 4, 2019 at 10:10 AM Christian Lamparter <chunkeey@gmail.com> wrote:
> On Monday, February 4, 2019 4:45:12 PM CET Kalle Valo wrote:
> > Christian Lamparter <chunkeey@gmail.com> writes:
> > > --- a/drivers/net/wireless/ath/ath10k/core.c
> > > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > > @@ -2649,6 +2649,13 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
> > >             goto err_hif_stop;
> > >     }
> > >
> > > +   status = ath10k_wmi_pdev_set_base_macaddr(ar, ar->mac_addr);
> > > +   if (status) {
> > > +           ath10k_err(ar,
> > > +                      "failed to set base mac address: %d\n", status);
> > > +           goto err_hif_stop;
> > > +   }
> >
> > Oh, and as the new parameter is not supported with WMI TLV interface
> > (QCA6174, WCN3990 etc) this will print an error on those.
>
> This also means that Brian won't be able to test/verify this anyway?

Well, I'd be able to tell you if this started dumping new errors to the log :)

And in fact, it seems this crashes my firmware:

[  150.091401] qcom-q6v5-mss 4080000.remoteproc: fatal error received:
err_qdi.c:456:EF:wlan_process:1:cmnos_thread.c:3921:Asserted in
wlan_dev.c:WLAN_GET_MAC_ID_FROM_WMI_PDEV_ID:536

Note that I'm running WCN3990, and I haven't configure any sort of PD
restart -- so any WiFi firmware assertions/crashes take down the
entire modem/WiFi.

IOW:

Tested-and-found-wanting-by: Brian Norris <briannorris@chromium.org>

Willing to test a v2!

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
