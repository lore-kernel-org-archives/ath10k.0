Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0225.hostedemail.com ([216.40.44.225]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRG7l-0006sk-8g
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 06:41:29 +0000
Message-ID: <1380696054.2081.35.camel@joe-AO722>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Tue, 01 Oct 2013 23:40:54 -0700
In-Reply-To: <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, netdev <netdev@vger.kernel.org>
Cc: ath10k@lists.infradead.org

On Wed, 2013-10-02 at 07:59 +0300, Kalle Valo wrote:
> (Cutting the CC smaller)

Please include netdev.  (cc'd)

> Joe Perches <joe@perches.com> writes:
> 
> > Convert the memset/memcpy uses of 6 to ETH_ALEN
> > where appropriate.
[]
> > Signed-off-by: Joe Perches <joe@perches.com>
[]
> Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
