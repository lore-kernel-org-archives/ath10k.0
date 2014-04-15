Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZsKV-0001ul-R6
 for ath10k@lists.infradead.org; Tue, 15 Apr 2014 01:38:32 +0000
Received: by mail-ve0-f171.google.com with SMTP id jy13so8372961veb.16
 for <ath10k@lists.infradead.org>; Mon, 14 Apr 2014 18:38:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <534C38AE.3070504@candelatech.com>
References: <534C38AE.3070504@candelatech.com>
Date: Tue, 15 Apr 2014 09:38:03 +0800
Message-ID: <CAEFj986VEybhQbG4OQptLMGakTD1fOTbbz9H+-TJKPef7ehG9g@mail.gmail.com>
Subject: Re: Modified ath10k firmware is now available for non-commercial use.
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Apr 15, 2014 at 3:36 AM, Ben Greear <greearb@candelatech.com> wrote:
> Our modified ath10k firmware binary is now available for download.  It may only be used
> for non-commercial purposes unless you get a commercial license from my company.
>
> The main thing this firmware supports that upstream firmware does not
> is lots of virtual stations connected to the same AP.
Is this firmware mainly for STA mode or AP mode or both?

> We have some
> additional stability fixes we found in testing, and probably have introduced
> some bugs as well.  We will be putting ongoing effort into improving
> this firmware.
>
> We also have the ability to decode firmware stack dumps (found in
> dmesg and/or /var/log/messages) if they come from our firmware.
> We cannot share the details of the decode nor tools to decode it,
> but we will try to fix the problems and/or describe the results of
> our decode in general terms.
>
> The firmware should work with stock 3.14 or other recent kernels,
> but we have done most testing using our own modified 3.14 kernel.
> Our kernel patches are required to support the additional stations,
> software-crypt, and other features specific to our firmware.
>
Raw Tx mode without the firmware stripping off the QoS control field
is supported?

> If you use our firmware and manage to crash it, please send to me the pertinent
> part of /var/log/messages (or dmesg), including any ath10k related ascii
> hex dumps.  Other non-crash bug reports are welcome too.
>
> Please do not bother the QCA developers with any bugs specific to our
> firmware (or our kernel patches).
>
> Links to the firmware binary, our 3.14.0+ kernel source, and related
> info is found here:
>
> http://www.candelatech.com/vsta.php
>
> Please let me know if you have any questions.
>
Thanks for your great work.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
