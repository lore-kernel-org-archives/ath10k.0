Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNy16-0004TB-Ij
 for ath10k@lists.infradead.org; Thu, 13 Mar 2014 05:17:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V2] ath10k: add recalc RTS/CTS protection method
References: <1393837661-15235-1-git-send-email-marek.kwaczynski@tieto.com>
Date: Thu, 13 Mar 2014 07:16:46 +0200
In-Reply-To: <1393837661-15235-1-git-send-email-marek.kwaczynski@tieto.com>
 (Marek Kwaczynski's message of "Mon, 3 Mar 2014 10:07:41 +0100")
Message-ID: <87txb2d6f5.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Kwaczynski <marek.kwaczynski@tieto.com> writes:

> Add recalculation of RTS/CTS protection when one or more legacy
> stations are connected to ath10k. In this case enable RTS/CTS
> protection and set sw retry profile are needed in the FW.
> Without this change legacy station is starved and has very low
> throughput.
>
> Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
