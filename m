Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqqt-0008ER-GA
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:57:59 +0000
MIME-Version: 1.0
Subject: Re: ath10k: replace config_enabled() with IS_REACHABLE()
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1471969646-13119-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <388c99a317f2431596e43d0feee204c9@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:57:30 +0200
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>

Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> Commit 97f2645f358b ("tree-wide: replace config_enabled() with
> IS_ENABLED()") mostly did away with config_enabled().
> 
> This is one of the postponed TODO items as config_enabled() is used
> for a tristate option here.  Theoretically, config_enabled() is
> equivalent to IS_BUILTIN(), but I guess IS_REACHABLE() is the best
> fit for this case because both CONFIG_HWMON and CONFIG_ATH10K are
> tristate.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

749bc03ae2cd ath10k: replace config_enabled() with IS_REACHABLE()

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9295945/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
