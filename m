Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x236.google.com ([2a00:1450:4008:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3nB9-00064Z-K1
 for ath10k@lists.infradead.org; Thu, 16 Jan 2014 13:40:16 +0000
Received: by mail-bk0-f54.google.com with SMTP id u14so1194778bkz.27
 for <ath10k@lists.infradead.org>; Thu, 16 Jan 2014 05:39:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87ppnst7jl.fsf@kamboji.qca.qualcomm.com>
References: <20140116123336.24551.2629.stgit@potku.adurom.net>
 <CAEFj987MkPQgyTU=K64mXuzCnm7T3SsUOSXiHkAovTVz0_kqwg@mail.gmail.com>
 <87ppnst7jl.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 16 Jan 2014 21:39:51 +0800
Message-ID: <CAEFj986GB5ehTMAWz-9qWOaqT=ck1T61AAgg-qxXLw-MS=q8cQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: enable firmware STA quick kickout
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Tested and worked.

Thanks

----
Chun-Yeow

On Thu, Jan 16, 2014 at 8:50 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>> Just would like to know whether the STA is deleted by FW when the FW
>> is sending the WMI_PEER_STA_KICKOUT_EVENTID to the host?
>
> AFAICS the firmware just sends the event and assumes that the host
> deletes the peer. Luckily in thise case it doesn't seem to do any peer
> management on it's own.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
