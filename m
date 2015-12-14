Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8RBR-0002le-AL
 for ath10k@lists.infradead.org; Mon, 14 Dec 2015 11:20:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: allow Mesh Point to install peer security key
References: <1449165055-27782-1-git-send-email-poh@qca.qualcomm.com>
Date: Mon, 14 Dec 2015 13:20:16 +0200
In-Reply-To: <1449165055-27782-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Thu, 3 Dec 2015 09:50:55 -0800")
Message-ID: <877fkh46q7.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Mesh Point requires peer security key install when running
> in secured mode since it's a type of peer links, otherwise peer
> link will be removed due to key install failure.
>
> MFP feature set is required to run Mesh in secured mode and
> QCA988X firmware, 10.2.4.70.14-2 and above, is the only one
> supporting secured Mesh at this moment.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
