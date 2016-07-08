Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLPVb-00047p-JB
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 06:43:31 +0000
MIME-Version: 1.0
Subject: Re: [v2,
 1/5] ath10k: Ensure txrx-compl-task is stopped when cleaning htt-tx.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
Message-ID: <6274be639a7342a7940d391ae0dac4a5@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 08:43:03 +0200
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Otherwise, the txrx-compl-task may access some bad memory?
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Thanks, 2 patches applied to ath-next branch of ath.git:

de0170beaa88 ath10k: ensure txrx-compl-task is stopped when cleaning htt-tx
6d68f7900d25 ath10k: ensure peer_map references are cleaned up

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/8727831/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
