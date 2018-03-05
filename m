Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr50043.outbound.protection.outlook.com ([40.107.5.43]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esvA4-0006sd-Kp
 for ath10k@lists.infradead.org; Mon, 05 Mar 2018 18:48:38 +0000
Subject: Re: [PATCH 1/2] ath10k: Add WMI FWTEST command support
References: <1520233148-26050-1-git-send-email-akolli@codeaurora.org>
 <1520233148-26050-2-git-send-email-akolli@codeaurora.org>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <94f133b3-ee5d-6ed8-d7e8-20dff9aaede2@bowerswilkins.com>
Date: Mon, 5 Mar 2018 10:48:07 -0800
MIME-Version: 1.0
In-Reply-To: <1520233148-26050-2-git-send-email-akolli@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Anilkumar Kolli <akolli@codeaurora.org>, ath10k@lists.infradead.org
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>, linux-wireless@vger.kernel.org

From: Sathishkumar Muruganandam <murugana@codeaurora.org>
> This patch adds support for WMI_FWTEST_CMD.
> This command is used for setting the wifi parameters.

It's too lack of information in commit message.
You should add such what values are acceptable for which purpose by each 
param_id and param_value to make this changes meaningful to community.

Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
