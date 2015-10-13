Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlzCI-0003SM-HS
 for ath10k@lists.infradead.org; Tue, 13 Oct 2015 13:00:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Cleanup ath10k_mac_register() error handling
References: <1444320953-2154-1-git-send-email-jjohnson@qca.qualcomm.com>
Date: Tue, 13 Oct 2015 16:00:19 +0300
In-Reply-To: <1444320953-2154-1-git-send-email-jjohnson@qca.qualcomm.com>
 (Jeff Johnson's message of "Thu, 8 Oct 2015 09:15:53 -0700")
Message-ID: <87io6aq5y4.fsf@kamboji.qca.qualcomm.com>
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
To: Jeff Johnson <jjohnson@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Jeff Johnson <jjohnson@qca.qualcomm.com> writes:

> The logic in the error-handling path of ath10k_mac_register() is
> divergent from the logic in ath10k_mac_unregister().  Update the
> ath10k_mac_register() error handling logic to align with the
> ath10k_mac_unregister() logic.
>
> Signed-off-by: Jeff Johnson <jjohnson@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
