Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmZAb-0008EC-6U
 for ath10k@lists.infradead.org; Tue, 20 May 2014 01:48:45 +0000
Received: by mail-vc0-f174.google.com with SMTP id lh14so10470790vcb.5
 for <ath10k@lists.infradead.org>; Mon, 19 May 2014 18:48:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1400498110-12879-1-git-send-email-michal.kazior@tieto.com>
References: <1400498110-12879-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 20 May 2014 09:48:23 +0800
Message-ID: <CAEFj985cRsbQozdoHb1-c1wkuKf79f06hEvtDxa-ufZyHJiHsA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix protected flag stripping
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, May 19, 2014 at 7:15 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> This prevents protected flag being stripped from
> undecrypted raw sniffed frames when monitor
> interface is active.
>
> Reported-by: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Tested-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Test and work. Thanks

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
