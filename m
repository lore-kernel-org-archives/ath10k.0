Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQ8zv-000399-O4
 for ath10k@lists.infradead.org; Thu, 21 Jul 2016 08:06:24 +0000
Date: Thu, 21 Jul 2016 10:05:42 +0200
From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
Message-ID: <20160721080541.GB2658@redhat.com>
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
 <20160721070938.GA2658@redhat.com>
 <CANUX_P3ADxi+RHkH=d8Ypcqy9WVKSu4JYH7K3HtTNCuWg3wCeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANUX_P3ADxi+RHkH=d8Ypcqy9WVKSu4JYH7K3HtTNCuWg3wCeQ@mail.gmail.com>
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
To: Emmanuel Grumbach <egrumbach@gmail.com>
Cc: prarit@redhat.com, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On Thu, Jul 21, 2016 at 10:36:42AM +0300, Emmanuel Grumbach wrote:
> On Thu, Jul 21, 2016 at 10:09 AM, Stanislaw Gruszka <sgruszka@redhat.com> wrote:
> > On Tue, Jul 19, 2016 at 03:00:37PM +0200, Michal Kazior wrote:
> >> Firmware files are versioned to prevent older
> >> driver instances to load unsupported firmware
> >> blobs. This is reflected with a fallback logic
> >> which attempts to load several firmware files.
> >>
> >> This however produced a lot of unnecessary
> >> warnings sometimes confusing users and leading
> >> them to rename firmware files making things even
> >> more confusing.
> >
> > This happens on kernels configured with
> > CONFIG_FW_LOADER_USER_HELPER_FALLBACK and cause not only ugly warnings,
> > but also 60 seconds delay before loading next firmware version.
> > For some reason RHEL kernel needs above config option, so this
> > patch is very welcome from my perspective.
> >
> 
> Sorry for my ignorance but how does the firmware loading work if not
> with udev's help?

I'm not sure exactly, but I think kernel VFS layer is capable to copy
file data directly from mounted filesystem without user space helper.

> As you can imagine, iwlwifi is suffering from the
> same problem and I would be interested in applying the same change,
> but I'd love to understand a bit more :)

Yes, iwlwifi (and some other drivers) suffer from this. However this
happen when the newest firmware version is not installed on the system
and CONFIG_FW_LOADER_USER_HELPER_FALLBACK is enabled. What I suppose
it's not common.

I started to see this currently, because that option was enabled on 
RHEL kernel. BTW: I think Prarit iwlwifi thermal_zone problem was
happened because of that, i.e. thermal device was not functional
because f/w wasn't loaded due to big delay.

I'm not sure if replacing to request_firmware_direct() is a good
fix though. For example I can see this problem also on brcmfmac, which
use request_firmware_nowait(). I think I would rather prefer special
helper for firmware drivers that needs user helper and have
request_firmware() be direct as default.

Stanislaw

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
