Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x231.google.com ([2607:f8b0:4001:c0b::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bJrpb-0004f4-Uw
 for ath10k@lists.infradead.org; Mon, 04 Jul 2016 00:33:48 +0000
Received: by mail-it0-x231.google.com with SMTP id f6so53388484ith.0
 for <ath10k@lists.infradead.org>; Sun, 03 Jul 2016 17:33:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467371245-5426-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1467371245-5426-1-git-send-email-vthiagar@qti.qualcomm.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Mon, 4 Jul 2016 10:33:07 +1000
Message-ID: <CAGRGNgVHuWVf4i3MmPUKJuGQ+MmFVY-AVdVbgYbLX=uyBCu=mQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix possible wrong rx_busy time reporting in
 QCA4019
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi All,

On Fri, Jul 1, 2016 at 9:07 PM, Vasanthakumar Thiagarajan
<vthiagar@qti.qualcomm.com> wrote:
> As hw cycle counters in QCA4019 wraparound independantly in QCA4019
> it is possible cycle counter and rx clear counter would wraparound
> at the same time. Current logic assumes only one of the counters
> would wraparound at anytime. Fix this by moving 'else' part to
> another 'if'.
>
> Fixes: 8e100354a98 ("ath10k: fix cycle counter wraparound handling for QCA4019")
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Looks right to me.

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
