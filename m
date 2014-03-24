Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS0KN-00071b-T0
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 08:33:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix the peer mac address in getting stats
References: <1395380076-4306-1-git-send-email-yeohchunyeow@gmail.com>
Date: Mon, 24 Mar 2014 10:33:05 +0200
In-Reply-To: <1395380076-4306-1-git-send-email-yeohchunyeow@gmail.com>
 (Chun-Yeow Yeoh's message of "Fri, 21 Mar 2014 13:34:36 +0800")
Message-ID: <87zjkg6loe.fsf@kamboji.qca.qualcomm.com>
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Chun-Yeow Yeoh <yeohchunyeow@gmail.com> writes:

> Using the macro to convert the MAC address from WMI word
> format to char array has lead to the wrong peer mac
> address printed out while retrieving the peer stats from
> FW. Fix this.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
