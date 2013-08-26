Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VE3Hs-0000Dz-AG
 for ath10k@lists.infradead.org; Mon, 26 Aug 2013 20:21:21 +0000
Received: by mail-la0-f52.google.com with SMTP id ev20so2672368lab.25
 for <ath10k@lists.infradead.org>; Mon, 26 Aug 2013 13:20:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Date: Mon, 26 Aug 2013 13:20:32 -0700
Message-ID: <CAB=NE6X=P2hTnOC8xqFwb=-32-hBgx=ndq3KHoUG83KptKv0vA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ath10k: fixes
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Mon, Aug 26, 2013 at 1:53 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>   ath10k: fix issues on non-preemptible systems

This patch looks like a stable candidate fix. Please annotate as such
if you confirm. Also, I reviewed other ath10k "fixes" and I see no
practice of propagating any patches to stable yet. Can you please
start doing that? If there were patches which are already merged
upstream that should be propagated to stable then they can be
submitted as stable candidate patches.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
