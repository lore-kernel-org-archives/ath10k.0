Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9xKB-0005RE-96
 for ath10k@lists.infradead.org; Thu, 15 Aug 2013 13:10:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: add support for HTT 3.0
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
 <1376036014-29707-1-git-send-email-michal.kazior@tieto.com>
 <1376036014-29707-4-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 Aug 2013 16:10:04 +0300
In-Reply-To: <1376036014-29707-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 9 Aug 2013 10:13:34 +0200")
Message-ID: <878v0314nn.fsf@kamboji.qca.qualcomm.com>
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

> New firmware comes with new HTT protocol version.
> In 3.0 the separate mgmt tx command has been
> removed. All traffic is to be pushed through data
> tx (tx_frm) command with a twist - FW seems to not
> be able (yet?) to access tx fragment table so for
> manamgement frames frame pointer is passed
> directly.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Because I dropped patch 1 this patch had conflicts. I tried to be extra
careful, but please double check my conflict resolution.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
