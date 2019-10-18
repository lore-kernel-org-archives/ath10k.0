Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLJWA-0002Z9-BM
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 04:05:35 +0000
Received: by mail-pg1-x543.google.com with SMTP id i32so2573497pgl.10
 for <ath10k@lists.infradead.org>; Thu, 17 Oct 2019 21:05:33 -0700 (PDT)
Date: Thu, 17 Oct 2019 21:05:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] Fix a NULL-ptr-deref bug in
 ath10k_usb_alloc_urb_from_pipe
Message-ID: <20191018040530.GA28167@roeck-us.net>
References: <20190804003101.11541-1-benquike@gmail.com>
 <20190831213139.GA32507@roeck-us.net>
 <87ftlgqw42.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ftlgqw42.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Hui Peng <benquike@gmail.com>, davem@davemloft.net

On Sun, Sep 01, 2019 at 11:06:05AM +0300, Kalle Valo wrote:
> Guenter Roeck <linux@roeck-us.net> writes:
> 
> > Hi,
> >
> > On Sat, Aug 03, 2019 at 08:31:01PM -0400, Hui Peng wrote:
> >> The `ar_usb` field of `ath10k_usb_pipe_usb_pipe` objects
> >> are initialized to point to the containing `ath10k_usb` object
> >> according to endpoint descriptors read from the device side, as shown
> >> below in `ath10k_usb_setup_pipe_resources`:
> >> 
> >> for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
> >>         endpoint = &iface_desc->endpoint[i].desc;
> >> 
> >>         // get the address from endpoint descriptor
> >>         pipe_num = ath10k_usb_get_logical_pipe_num(ar_usb,
> >>                                                 endpoint->bEndpointAddress,
> >>                                                 &urbcount);
> >>         ......
> >>         // select the pipe object
> >>         pipe = &ar_usb->pipes[pipe_num];
> >> 
> >>         // initialize the ar_usb field
> >>         pipe->ar_usb = ar_usb;
> >> }
> >> 
> >> The driver assumes that the addresses reported in endpoint
> >> descriptors from device side  to be complete. If a device is
> >> malicious and does not report complete addresses, it may trigger
> >> NULL-ptr-deref `ath10k_usb_alloc_urb_from_pipe` and
> >> `ath10k_usb_free_urb_to_pipe`.
> >> 
> >> This patch fixes the bug by preventing potential NULL-ptr-deref.
> >> 
> >> Signed-off-by: Hui Peng <benquike@gmail.com>
> >> Reported-by: Hui Peng <benquike@gmail.com>
> >> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> >
> > This patch fixes CVE-2019-15099, which has CVSS scores of 7.5 (CVSS 3.0)
> > and 7.8 (CVSS 2.0). Yet, I don't find it in the upstream kernel or in Linux
> > next.
> >
> > Is the patch going to be applied to the upstream kernel anytime soon ?
> 
> Same answer as in patch 1:
> 
> https://patchwork.kernel.org/patch/11074655/
> 

Sorry to bring this up again. The ath6k patch made it into the upstream
kernel, but the ath10k patch didn't. Did it get lost, or was there a
reason not to apply this patch ?

Thanks,
Guenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
