Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZIjZ-0000Jx-OA
 for ath10k@lists.infradead.org; Fri, 26 Feb 2016 13:47:07 +0000
Received: by mail-oi0-x234.google.com with SMTP id k67so5303417oia.3
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2016 05:46:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56CF4BDE.1060404@codeaurora.org>
References: <56CF24B4.8030807@dks-koeln.de> <56CF4BDE.1060404@codeaurora.org>
Date: Fri, 26 Feb 2016 21:46:44 +0800
Message-ID: <CAEFj9871Ga=Q+u3dW=gf5V=E2Hr1rRQ7gjd_DX4Z9TTdVpu4pg@mail.gmail.com>
Subject: Re: Which firmware has raw mode support
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
To: Peter Oh <poh@codeaurora.org>
Cc: Xue Liu <xue.liu@dks-koeln.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

You can take a look on dmesg to further confirm:
ath10k_pci 0000:06:00.0: firmware ver 10.2.4.70.19-2 api 5 features
no-p2p,raw-mode,mfp crc32 809ef648

----
Chun-Yeow

On Fri, Feb 26, 2016 at 2:45 AM, Peter Oh <poh@codeaurora.org> wrote:
>
> On 02/25/2016 07:58 AM, Xue Liu wrote:
>>
>> Hello,
>>
>> I have a WLE900VX (QCA9880) 11ac card and would like to do some mesh test.
>>
>> I have try some firmware from
>> https://github.com/kvalo/ath10k-firmware/tree/master/QCA988X/10.2.4 but no
>> luck.
>>
>> Could someone tell me that which firmware has raw mode support. That is
>> very appreciate.
>
> raw mode supported since firmware-5.bin_10.2.4.70.6-2 .
> check out and try it from
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA988X/10.2.4
>
> --
> Peter
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
