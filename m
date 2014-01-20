Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5ICt-00069F-FG
 for ath10k@lists.infradead.org; Mon, 20 Jan 2014 17:00:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: AP mode, set UAPSD params correctly
References: <1390234821-4405-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 20 Jan 2014 18:59:46 +0200
In-Reply-To: <1390234821-4405-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Mon, 20 Jan 2014 17:20:20 +0100")
Message-ID: <8738kilhbx.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Move UAPSD params settings after peer assoc
> command. This is required to setup UAPSD
> params correctly.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

This is a pretty vague description. What is correct today can be totally
wrong tomorrow :)

So I would prefer that you describe a bit more about this change. At
least describe the bug you are fixing (or mention the motivation behind
the change).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
