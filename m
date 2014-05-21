Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn9nh-0007bn-89
 for ath10k@lists.infradead.org; Wed, 21 May 2014 16:55:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix protected flag stripping
References: <1400498110-12879-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 21 May 2014 19:55:03 +0300
In-Reply-To: <1400498110-12879-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 19 May 2014 13:15:10 +0200")
Message-ID: <87k39fxeag.fsf@kamboji.qca.qualcomm.com>
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
Cc: yeohchunyeow@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This prevents protected flag being stripped from
> undecrypted raw sniffed frames when monitor
> interface is active.
>
> Reported-by: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>

I changed this to match the Tested-by line:

    Reported-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
    Tested-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
