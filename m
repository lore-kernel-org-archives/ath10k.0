Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNdnX-0006Fi-Bp
 for ath10k@lists.infradead.org; Tue, 29 May 2018 12:32:20 +0000
Received: by mail-wm0-x242.google.com with SMTP id f8-v6so40174821wmc.4
 for <ath10k@lists.infradead.org>; Tue, 29 May 2018 05:32:08 -0700 (PDT)
Message-ID: <bc31b06dc4093b8613fbde6a13f16bd7e8c31e82.camel@gmail.com>
Subject: Re: Frequent ath10k crashes with QCA6174 on kernels 4.16 and 4.17
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Date: Tue, 29 May 2018 15:32:05 +0300
In-Reply-To: <87po1e69tz.fsf@kamboji.qca.qualcomm.com>
References: <c92e04d5b80af2a640ab97efce32d987ffb27ffe.camel@gmail.com>
 <87po1e69tz.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
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
Cc: ath10k@lists.infradead.org, ryanhsu@codeaurora.org

On Tue, 2018-05-29 at 13:21 +0300, Kalle Valo wrote:
> > So it seems that either the driver or the firmware can't cope with
> > it
> > when the AP changes the bandwidth.
> > Here is the Fedora bug report:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1577106
> > 
> > Is there anything that can be done to improve the stability of
> > ath10k on this system?
> > I see there is a lot going on in the upstream repo, but not sure
> > which
> > branch to try: ath-next or qca?
> 
> I think this patch should fix the firmware crash:
> 
> ath10k: Update the phymode along with bandwidth change request
> 
> https://patchwork.kernel.org/patch/10183453/
> 
> Unfortunately it didn't apply to my tree so I had to drop it. Few
> days
> ago I was talking with Ryan and he said he is planning to send v2,
> but
> I'm sure he don't mind if someone else can send the v2 either. The
> faster we can apply the patch, and get it to stable releases, the
> better
> as we seems to be a very common issue.

I don't have much experience with this, but will take a look and let
you know how that goes.

> But there also seems to be another bug related to firmware restart,
> it
> shouldn't crash the kernel! Does the kernel crash also when crashing
> the
> kernel using simulate_fw_crash debugfs file?

Yes, tried it just now. The driver can survive 2 simulated hard
crashes. After the 3rd hard crash, it reproduces the same issue that I
described in the bugreport: Wifi stops working. I can turn it off. When
I turn it on again, the whole system hangs completely.

You would expect that a single driver crash should not affect the whole
system like this, but it does.

Is there a chance this is already fixed upstream? In general, which of
your branches should I try to use with this device?
ath-next or ath-qca?

Thanks & best regards,
Timur


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
