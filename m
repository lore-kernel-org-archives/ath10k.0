Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUAO2-0003i4-Ue
 for ath10k@lists.infradead.org; Sat, 07 Mar 2015 08:47:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: implement wmi roam event
References: <1425295932-10386-1-git-send-email-michal.kazior@tieto.com>
Date: Sat, 7 Mar 2015 10:46:36 +0200
In-Reply-To: <1425295932-10386-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 2 Mar 2015 12:32:11 +0100")
Message-ID: <87fv9hyz2r.fsf@kamboji.qca.qualcomm.com>
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

> This can be used to implement offloaded rssi
> threshold, beacon miss or even automatic
> in-firmware BSS roaming in the future.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

These patches have non-trivial conflicts. Can you rebase, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
