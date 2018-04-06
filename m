Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4MPZ-0008NL-EG
 for ath10k@lists.infradead.org; Fri, 06 Apr 2018 08:07:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v12] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20180226084406.2093-1-s.gottschall@dd-wrt.com>
 <871sftemru.fsf@kamboji.qca.qualcomm.com>
 <c4a1313a-73d2-a028-4fca-09f6fb6e56bd@dd-wrt.com>
 <de9c007f-26e3-a511-e944-91e90aac7787@dd-wrt.com>
Date: Fri, 06 Apr 2018 11:07:39 +0300
In-Reply-To: <de9c007f-26e3-a511-e944-91e90aac7787@dd-wrt.com> (Sebastian
 Gottschall's message of "Thu, 5 Apr 2018 22:00:43 +0200")
Message-ID: <87h8oosqpg.fsf@codeaurora.org>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> i have some comments about your check warnings.
> some of them are bogus. for instance they advise to use "unsigned int"
> instead of "unsigned". this might be better, but
> the original kernel header uses "unsigned" as api definition. so i
> decided to use the same declarations here.

Sure, but using "unsigned int" won't create any harm either.

> for the rest like whitespaces i will make a new version and remove them

You missed my comment in my earlier mail that I'll send the next
version. I have already fixed all the warnings so let me submit it. I'll
do also some other changes.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
