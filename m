Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yh0-x22a.google.com ([2607:f8b0:4002:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmL2Y-0005wO-CG
 for ath10k@lists.infradead.org; Mon, 19 May 2014 10:43:30 +0000
Received: by mail-yh0-f42.google.com with SMTP id t59so6685077yho.29
 for <ath10k@lists.infradead.org>; Mon, 19 May 2014 03:43:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=9c4MPHmqGRAgEvADSp9K+Kda-U75PRAUZE8FH70VOAw@mail.gmail.com>
References: <CAEFj986_nUoRY7qOf7=6divui_sa2tMnfjd8vS0w00Mk62GqnA@mail.gmail.com>
 <CA+BoTQ=9c4MPHmqGRAgEvADSp9K+Kda-U75PRAUZE8FH70VOAw@mail.gmail.com>
Date: Mon, 19 May 2014 18:43:08 +0800
Message-ID: <CAEFj986w3ByHH7LNRgYFKNsVym8g3FJFxGjSJ1-b91r1bnooqw@mail.gmail.com>
Subject: Re: Protected flag is clear in Monitor Mode
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, May 19, 2014 at 5:25 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 16 May 2014 06:38, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> Hi, all
>>
>> I try to use ath10k (firmware version 10.1.467.2-1_ as standalone
>> monitor mode. I assume that monitor mode will allows the frame to pass
>> to upper layer without any modification.
>>
>> But it seems that the protected flag in frame control is clear while I
>> capture with wireshark. I has verified that the ath9k has not such
>> issue and the protected flag is set.
>>
>> So is this a known issue in monitor mode for ath10k?
>
> Good catch!
>
> ath10k doesn't really check if frame was decrypted by firmware or not
> (there's no explicit descriptor flag for that).
>
> I think we need to rely on the raw frame decap mode as an implicit
> indication a frame must not have it's protected flag stripped.
>

I try to set TARGET_10X_RX_DECAP_MODE to ATH10K_HW_TXRX_RAW. But still
not working.

So we need firmware change for this?

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
