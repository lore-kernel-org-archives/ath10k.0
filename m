Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZfbZ-0008ST-Kn
 for ath10k@lists.infradead.org; Thu, 11 Jan 2018 16:21:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: SparkLan WPEQ-261ACN (QCA6174) : packets loss ?
References: <CAEV+hqzaqrabZ2uYHHHSNxcmddyFU5Q8odyPqrPZSt-DTJye7A@mail.gmail.com>
Date: Thu, 11 Jan 2018 18:21:10 +0200
In-Reply-To: <CAEV+hqzaqrabZ2uYHHHSNxcmddyFU5Q8odyPqrPZSt-DTJye7A@mail.gmail.com>
 (Contrib Open Source's message of "Thu, 11 Jan 2018 16:00:35 +0100")
Message-ID: <87inc8tlhl.fsf@kamboji.qca.qualcomm.com>
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
To: Contrib Open Source <contrib.open.source@gmail.com>
Cc: ath10k@lists.infradead.org

Contrib Open Source <contrib.open.source@gmail.com> writes:

> So my questions are :

> Q1) is it correct to "downgrade" firmware API in this case (symbolic
> link firmware-5.bin) ?

It's not safe, you have to really know what you are doing and understand
the ath10k internals. We do these FW API increases (5 -> 6) for a
reason, usually because the new firmware won't work with older version
of ath10k.

But if you want to run latest ath10k on older kernels I recommend to
look at backports project:

https://backports.wiki.kernel.org/index.php/Main_Page

> Q2) is it possible to use recent board files with an "older" firmware
> file ?

To my knowledge board files are not dependent on the firmware versions.
So yes, you should be able to use newer board-2.bin with older firmware
release.

> Q3) how to know which firmware files to use for my specific device ?

The firmware releases are not "device" specific (but of course it
depends on what you mean with device in this context). But my
recommendation is to always use the latest firmware which works with
your kernel (WITHOUT any symlink hacks etc).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
