Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvkQi-0001E3-ID
 for ath10k@lists.infradead.org; Tue, 02 Dec 2014 10:11:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Pull request: ath 20141201
References: <871tojr16m.fsf@kamboji.qca.qualcomm.com>
 <20141201205150.GC7266@tuxdriver.com>
Date: Tue, 2 Dec 2014 12:10:59 +0200
In-Reply-To: <20141201205150.GC7266@tuxdriver.com> (John W. Linville's message
 of "Mon, 1 Dec 2014 15:51:50 -0500")
Message-ID: <87ppc2nyz0.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: "John W. Linville" <linville@tuxdriver.com>

"John W. Linville" <linville@tuxdriver.com> writes:

> On Mon, Dec 01, 2014 at 02:42:41PM +0200, Kalle Valo wrote:
>> Hi John,
>> 
>> here's a pull request I'm hoping still to get to 3.19. The changelog is
>> below. Please let me know if you have any problems.
>> 
>> ----------------------------------------------------------------------
>> Only ath10k changes this time and no major changes. Most visible are:
>> 
>> o new debugfs interface for runtime firmware debugging (Yanbo)
>> 
>> o fix shared WEP (Sujith)
>> 
>> o don't rebuild whenever kernel version changes (Johannes)
>> 
>> o lots of refactoring to make it easier to add new hw support (Michal)
>> 
>> There's also smaller fixes and improvements with no point of listing
>> here.
>> 
>> ----------------------------------------------------------------------

[...]

> Pulling now...

Thanks!

ath10k list: I'm planning this to be the last pull request for 3.19. So
anything not commited yet will go to 3.20, for example Device Tree and
WMI TLV stuff. Which is actually a good thing, we get more time for
testing.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
