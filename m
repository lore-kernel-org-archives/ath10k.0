Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiMFV-00024D-MD
 for ath10k@lists.infradead.org; Wed, 15 Apr 2015 12:16:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath: define JP DFS patterns separated from FCC
References: <413e207292d5c52cd621912762e6d4a40a8dfc48.1427845453.git.poh@qca.qualcomm.com>
Date: Wed, 15 Apr 2015 15:16:27 +0300
In-Reply-To: <413e207292d5c52cd621912762e6d4a40a8dfc48.1427845453.git.poh@qca.qualcomm.com>
 (Peter Oh's message of "Tue, 31 Mar 2015 16:44:42 -0700")
Message-ID: <87k2xd7fj8.fsf@kamboji.qca.qualcomm.com>
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

> Separate Japan's DFS pattern from FCC to control PPB threshold.
>
> Currently all the radar detectors use the same threshold rate at
> 50%, but it's not able to achieve if data traffic rate is higher
> than 40% because WLAN baseband used by ath9k and ath10k often fails
> detecting radar pulses, so that SW cannot get enough radar reports
> to achieve the rate.
>
> Since Japan's W53 band requires 50% data traffic during its DFS
> test we need to apply different threshold rate than others on it.
> Hence define its own pattern to give flexibility to threshold rate.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
