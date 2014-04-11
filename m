Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYUDN-0008CP-4n
 for ath10k@lists.infradead.org; Fri, 11 Apr 2014 05:41:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: double check bmi xfer pointers
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 11 Apr 2014 08:40:56 +0300
In-Reply-To: <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 10 Apr 2014 12:05:55 +0200")
Message-ID: <8738hkh193.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> If for some reason copy engine ring buffer became
> corrupt ath10k could crash the machine due to
> invalid pointer dereference. It's very unlikely
> but devices can never be fully trusted so verify
> if the bmi xfer pointer read back from copy engine
> matches the original pointer.

The big question is why does this happen? Does this happen only with
Ben's firmware or is it a more generic problem?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
