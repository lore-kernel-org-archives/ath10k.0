Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbORI-0002kd-93
 for ath10k@lists.infradead.org; Tue, 07 Oct 2014 06:40:05 +0000
Received: by mail-la0-f45.google.com with SMTP id q1so5731897lam.4
 for <ath10k@lists.infradead.org>; Mon, 06 Oct 2014 23:39:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj985Di47A3OUSKn3ycW01Ohmeqs=uL4y_59YL+HyUDWvO0g@mail.gmail.com>
References: <1412251000-25377-1-git-send-email-janusz.dziedzic@tieto.com>
 <CAEFj985Di47A3OUSKn3ycW01Ohmeqs=uL4y_59YL+HyUDWvO0g@mail.gmail.com>
Date: Tue, 7 Oct 2014 08:39:33 +0200
Message-ID: <CALhHN=pFM8-Ck62nzNfOkS+bU3Xm_k30_AYrqagP0tY9nuV4pw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't create bssid peer for ibss
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 4 October 2014 03:06, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> On Thu, Oct 2, 2014 at 7:56 PM, Janusz Dziedzic
> <janusz.dziedzic@tieto.com> wrote:
>> It's not really necessary to create bssid peer for
>> bssid. Self-address peer is sufficient.
>>
>> This prevents some firmware revisions from crashing.
>>
>
> Which firmware? AFAIK, only firmware version 636 supports adhoc, right?
>
Yes, this is for 636.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
