Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIiOq-0000IA-Ug
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 17:36:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Compiling custom ath10k: step 5 minor issue
References: <530BB3E2.8000705@intec.ugent.be>
Date: Wed, 26 Feb 2014 19:35:38 +0200
In-Reply-To: <530BB3E2.8000705@intec.ugent.be> (Bart Jooris's message of "Mon, 
 24 Feb 2014 22:04:34 +0100")
Message-ID: <87wqghkc9h.fsf@kamboji.qca.qualcomm.com>
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
To: Bart.Jooris@intec.ugent.be
Cc: ath10k@lists.infradead.org

Bart Jooris <Bart.Jooris@intec.ugent.be> writes:

> ../ath/net/core/flow_dissector.c seems to be changed?
>
> ./gentree.py --verbose --clean --git-revision master --copy-list
> copy-list.ath ../ath ../backports-output
> Get original source files from git ...
> Apply patches ...
> Not applying backport-adjustments/dma-buf.patch, not needed
> Applying patch backport-adjustments/flow_dissector.patch
>> patching file compat/net-core-flow_dissector.c
>> Hunk #1 FAILED at 177.
>> 1 out of 1 hunk FAILED -- saving rejects to file 
> compat/net-core-flow_dissector.c.rej

backports is always a moving target and you might get errors like these
when you create it on your own. There really isn't a reliable to avoid
it, you just have to fix the errors as you see them. 

Another option is that you use official backports releases, but then
ath10k will be few weeks old.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
