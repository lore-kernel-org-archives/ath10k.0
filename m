Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUGyy-00048Z-AC
 for ath10k@lists.infradead.org; Thu, 30 Apr 2020 21:44:37 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MkpOZ-1ikWeE3ZgF-00mKaP for <ath10k@lists.infradead.org>; Thu, 30 Apr
 2020 23:44:34 +0200
Received: by mail-qk1-f169.google.com with SMTP id 23so7487978qkf.0
 for <ath10k@lists.infradead.org>; Thu, 30 Apr 2020 14:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200430213101.135134-1-arnd@arndb.de>
 <20200430213101.135134-5-arnd@arndb.de>
 <49831bca-b9cf-4b9a-1a60-f4289e9c83c0@embeddedor.com>
In-Reply-To: <49831bca-b9cf-4b9a-1a60-f4289e9c83c0@embeddedor.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Apr 2020 23:44:16 +0200
Message-ID: <CAK8P3a0y0JTrsjFx1XRh7A6YdSZ=aJ1V3-Eajfsbz3HtQOEu7A@mail.gmail.com>
Subject: Re: [PATCH 04/15] ath10k: fix gcc-10 zero-length-bounds warnings
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
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Kees Cook <keescook@chromium.org>, Erik Stromdahl <erik.stromdahl@gmail.com>, Networking <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Thu, Apr 30, 2020 at 11:41 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> On 4/30/20 16:30, Arnd Bergmann wrote:
> > gcc-10 started warning about out-of-bounds access for zero-length
> > arrays:
> The treewide patch is an experimental change and, as this change only applies
> to my -next tree, I will carry this patch in it, so other people don't have
> to worry about this at all.

Ok, thanks!

       Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
