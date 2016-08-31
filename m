Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezwx-0004Br-CZ
 for ath10k@lists.infradead.org; Wed, 31 Aug 2016 07:28:44 +0000
MIME-Version: 1.0
Subject: Re: [1/4] ath10k: implement wmi echo command
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1468924452-23877-2-git-send-email-michal.kazior@tieto.com>
Message-ID: <9a7befb7bfad4d409c3a7cd3ab59bd91@euamsexm01a.eu.qualcomm.com>
Date: Wed, 31 Aug 2016 09:28:12 +0200
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
Cc: marek.puzyniak@tieto.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> wrote:
> Will be useful for implementing command barriers.
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, 4 patches applied to ath-next branch of ath.git:

e25854f2404c ath10k: implement wmi echo command
84d4911b7184 ath10k: implement wmi echo event
20ddca21dcf8 ath10k: add wmi command barrier utility
47b1848d9fde ath10k: fix spurious tx/rx during boot

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9236705/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
