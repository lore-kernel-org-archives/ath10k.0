Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx4.wp.pl ([212.77.101.11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJekt-0000Im-A3
 for ath10k@lists.infradead.org; Fri, 06 Feb 2015 08:59:16 +0000
Date: Fri, 6 Feb 2015 09:58:46 +0100
From: Jakub =?UTF-8?B?S2ljacWEc2tp?= <moorray3@wp.pl>
Subject: Re: [PATCH v2] ath10k: Replace ioread with mb to drain write buffer
Message-ID: <20150206095846.5d46f11e@north>
In-Reply-To: <7a87e5df81499e4d26a4f8bedf76ed3250a6f7bb.1422663244.git.poh@qca.qualcomm.com>
References: <7a87e5df81499e4d26a4f8bedf76ed3250a6f7bb.1422663244.git.poh@qca.qualcomm.com>
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

On Fri, 30 Jan 2015 16:14:30 -0800, Peter Oh wrote:
> Using ioread() to perform draining write buffer is excessive.
> Use compact API, mb(), that intended to be used for the case.
> It reduces total 14 CPU clocks per interrupt.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

I have no idea what the code does but this change looks suspicious. 
Usually the point of ioread() is to flush the interconnect buffers 
while mb() ensures ordering only from the CPU perspective.

Could you provide the reason *why* flushing buffers is unnecessary
in the commit message?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
