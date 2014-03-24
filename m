Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS1oI-0001ox-2K
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 10:08:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: fix rssi and rate reporting
References: <1395394437-4048-1-git-send-email-janusz.dziedzic@tieto.com>
 <1395394437-4048-2-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 24 Mar 2014 12:08:21 +0200
In-Reply-To: <1395394437-4048-2-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Fri, 21 Mar 2014 10:33:57 +0100")
Message-ID: <87eh1r7vu2.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> RSSI and RATE fields are valid only when START_VALID
> bit is set. So, in current implementation we have to
> remember/caclulate them when START_VALID and report the same
> when only END_VALID is set. In other case during high
> RX traffic we will report invalid RSSI (-95) and RATE (6Mbps)
> when only END_VALID bit set.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

It's not clear for me what (user visible) bug you are fixing, please
describe that in the commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
