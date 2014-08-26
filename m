Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMJLp-00007b-Ti
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 16:12:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix fw crash dumping
References: <1408961594-2440-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 26 Aug 2014 19:11:39 +0300
In-Reply-To: <1408961594-2440-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 25 Aug 2014 12:13:14 +0200")
Message-ID: <87d2bn1b9g.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Recent crash dump patches introduced a regression.
> If debugfs was disabled upon crash user could only
> see the following:
>
>  [  793.880000] ath10k: firmware crashed! (uuid n/a)
>  [  793.890000] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.1.467.2-1 api 2 htt 2.1
>  [  793.890000] ath10k: debug 0 debugfs 0 tracing 0 dfs 1
>
> The report was missing register dump. Fix it by
> printing registers regardless if crash_data is
> present or not.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
