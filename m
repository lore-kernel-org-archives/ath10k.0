Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fniI8-00082E-Tt
 for ath10k@lists.infradead.org; Thu, 09 Aug 2018 10:35:42 +0000
Subject: Re: Backporting issues, please help
References: <DM5PR1001MB21063EB20C5E272D700AB65B9D200@DM5PR1001MB2106.namprd10.prod.outlook.com>
 <87k1oz3k7w.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <d8b39785-04da-57c8-157a-93f31847a731@dd-wrt.com>
Date: Thu, 9 Aug 2018 12:35:28 +0200
MIME-Version: 1.0
In-Reply-To: <87k1oz3k7w.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, "Shu, Nick" <Nick.Shu@spirent.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


Am 09.08.2018 um 12:30 schrieb Kalle Valo:
> "Shu, Nick" <Nick.Shu@spirent.com> writes:
>
>> I'm trying to backport ath10k driver from 4.9 kernel into 4.8 kernel currently using .
>> In my 4.8 kernel, I built the backporting environment by using tag "v4.14-rc4-1".
>> When I used that Python script to generate backport tree, got an error:
>>
>> ./gentree.py --verbose --clean --git-revision master --copy-list copy-list.ath ../linux-4.9 ../backports-output
>> Get original source files from git ...
>> Traceback (most recent call last):
>>    File "./gentree.py", line 1107, in <module>
>>      ret = _main()
>>    File "./gentree.py", line 724, in _main
>>      logwrite=logwrite)
>>    File "./gentree.py", line 862, in process
>>      disable_list = add_automatic_backports(args)
>>    File "./gentree.py", line 276, in add_automatic_backports
>>      automatic_backport_mangle_c_file(f)), 'r'):
>> IOError: [Errno 2] No such file or directory: '../ct49-backports-output/compat/lib-refcount.c'
> I haven't used backprorts for years but I don't think you can use latest
> backports on older kernels (eg backports tag v4.14-rc4-1 on v4.9
> kernel). So if you use v4.14-rc4-1 tag you can only use v4.14 kernel
> source to generate the backports package.
>
> But backports list can help you better:
>
> https://backports.wiki.kernel.org/index.php/Mailing_list
>
> Ah, but I see from the archives that you asked there already.

you can also use the backports tree from openwrt. as far as i know the 
official backports tree is broken on many points so you need to manually 
edit alot of things
to get it to work. backports tree provided by openwrt did already take 
care of it
i once did my own backports version and it was alot of work of manually 
editing to get all to work

>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
