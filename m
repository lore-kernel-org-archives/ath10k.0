Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XaDo8-0001kP-Sy
 for ath10k@lists.infradead.org; Sat, 04 Oct 2014 01:06:49 +0000
Received: by mail-vc0-f174.google.com with SMTP id hq12so1344509vcb.5
 for <ath10k@lists.infradead.org>; Fri, 03 Oct 2014 18:06:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1412251000-25377-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1412251000-25377-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Sat, 4 Oct 2014 09:06:27 +0800
Message-ID: <CAEFj985Di47A3OUSKn3ycW01Ohmeqs=uL4y_59YL+HyUDWvO0g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't create bssid peer for ibss
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Oct 2, 2014 at 7:56 PM, Janusz Dziedzic
<janusz.dziedzic@tieto.com> wrote:
> It's not really necessary to create bssid peer for
> bssid. Self-address peer is sufficient.
>
> This prevents some firmware revisions from crashing.
>

Which firmware? AFAIK, only firmware version 636 supports adhoc, right?

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
