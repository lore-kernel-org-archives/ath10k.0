Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fniDq-00053B-5s
 for ath10k@lists.infradead.org; Thu, 09 Aug 2018 10:31:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Backporting issues, please help
In-Reply-To: <DM5PR1001MB21063EB20C5E272D700AB65B9D200@DM5PR1001MB2106.namprd10.prod.outlook.com>
 (Nick Shu's message of "Mon, 6 Aug 2018 14:31:09 +0000")
References: <DM5PR1001MB21063EB20C5E272D700AB65B9D200@DM5PR1001MB2106.namprd10.prod.outlook.com>
Date: Thu, 09 Aug 2018 13:30:59 +0300
Message-ID: <87k1oz3k7w.fsf@kamboji.qca.qualcomm.com>
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
To: "Shu, Nick" <Nick.Shu@spirent.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Shu, Nick" <Nick.Shu@spirent.com> writes:

> I'm trying to backport ath10k driver from 4.9 kernel into 4.8 kernel currently using .
> In my 4.8 kernel, I built the backporting environment by using tag "v4.14-rc4-1".
> When I used that Python script to generate backport tree, got an error:
>
> ./gentree.py --verbose --clean --git-revision master --copy-list copy-list.ath ../linux-4.9 ../backports-output
> Get original source files from git ...
> Traceback (most recent call last):
>   File "./gentree.py", line 1107, in <module>
>     ret = _main()
>   File "./gentree.py", line 724, in _main
>     logwrite=logwrite)
>   File "./gentree.py", line 862, in process
>     disable_list = add_automatic_backports(args)
>   File "./gentree.py", line 276, in add_automatic_backports
>     automatic_backport_mangle_c_file(f)), 'r'):
> IOError: [Errno 2] No such file or directory: '../ct49-backports-output/compat/lib-refcount.c'

I haven't used backprorts for years but I don't think you can use latest
backports on older kernels (eg backports tag v4.14-rc4-1 on v4.9
kernel). So if you use v4.14-rc4-1 tag you can only use v4.14 kernel
source to generate the backports package.

But backports list can help you better:

https://backports.wiki.kernel.org/index.php/Mailing_list

Ah, but I see from the archives that you asked there already.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
