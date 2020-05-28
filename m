Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHFF-0008EH-BZ
 for ath10k@lists.infradead.org; Thu, 28 May 2020 12:02:49 +0000
Received: by mail-lj1-x22c.google.com with SMTP id e4so10561740ljn.4
 for <ath10k@lists.infradead.org>; Thu, 28 May 2020 05:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200527165718.129307-1-briannorris@chromium.org>
In-Reply-To: <20200527165718.129307-1-briannorris@chromium.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 28 May 2020 22:02:31 +1000
Message-ID: <CAGRGNgX5n=0OEi7hMrmgVZGD=orGpgvkyLrhmXVKSFYdBJ+eUw@mail.gmail.com>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
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
To: Brian Norris <briannorris@chromium.org>
Cc: stable@vger.kernel.org, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Hi Brian,

On Thu, May 28, 2020 at 5:18 AM Brian Norris <briannorris@chromium.org> wrote:
>
> This reverts commit 2dc016599cfa9672a147528ca26d70c3654a5423.
>
> Users are reporting regressions in regulatory domain detection and
> channel availability.
>
> The problem this was trying to resolve was fixed in firmware anyway:

Should we tell the user their firmware needs to be upgraded if it
reports this regulatory domain instead of completely dropping support
for it?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
