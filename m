Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUMZp-0001o9-EY
 for ath10k@lists.infradead.org; Sun, 30 Mar 2014 20:43:34 +0000
Received: by mail-wi0-f176.google.com with SMTP id r20so2370254wiv.3
 for <ath10k@lists.infradead.org>; Sun, 30 Mar 2014 13:43:07 -0700 (PDT)
Received: from [192.168.1.50] (d51A5BB56.access.telenet.be. [81.165.187.86])
 by mx.google.com with ESMTPSA id bc51sm28138954eeb.22.2014.03.30.13.43.03
 for <ath10k@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Sun, 30 Mar 2014 13:43:03 -0700 (PDT)
Message-ID: <533881D6.9010301@intec.ugent.be>
Date: Sun, 30 Mar 2014 22:43:02 +0200
From: Bart Jooris <bart.jooris@gmail.com>
MIME-Version: 1.0
Subject: Re: Compiling custom ath10k: step 5 minor issue
References: <530BB3E2.8000705@intec.ugent.be>
 <87wqghkc9h.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wqghkc9h.fsf@kamboji.qca.qualcomm.com>
Reply-To: Bart.Jooris@intec.ugent.be
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
To: ath10k@lists.infradead.org

Hi all,

On 02/26/2014 06:35 PM, Kalle Valo wrote:
> Bart Jooris <Bart.Jooris@intec.ugent.be> writes:
>
>> ../ath/net/core/flow_dissector.c seems to be changed?
>>
>> ./gentree.py --verbose --clean --git-revision master --copy-list
>> copy-list.ath ../ath ../backports-output
>> Get original source files from git ...
>> Apply patches ...
>> Not applying backport-adjustments/dma-buf.patch, not needed
>> Applying patch backport-adjustments/flow_dissector.patch
>>> patching file compat/net-core-flow_dissector.c
>>> Hunk #1 FAILED at 177.
>>> 1 out of 1 hunk FAILED -- saving rejects to file
>> compat/net-core-flow_dissector.c.rej
> backports is always a moving target and you might get errors like these
> when you create it on your own. There really isn't a reliable to avoid
> it, you just have to fix the errors as you see them.
I needed one fix, in drivers_net_wireless_ath_wil6210_netdev.patch, to 
let all the hunks succeed. I ended up with gentree expecting 
combined.cocci in a tempdir...

...
Not applying 
collateral-evolutions/regulator/0001-bt8xx-rename-dst-ops.patch, not needed
Applying patch /tmp/Tgt2Ph/combined.cocci
Traceback (most recent call last):
   File "./gentree.py", line 843, in <module>
     ret = _main()
   File "./gentree.py", line 490, in _main
     logwrite=logwrite)
   File "./gentree.py", line 706, in process
     cwd=args.outdir)
   File "/usr/lib/python2.7/subprocess.py", line 709, in __init__
     errread, errwrite)
   File "/usr/lib/python2.7/subprocess.py", line 1326, in _execute_child
     raise child_exception
OSError: [Errno 2] No such file or directory


What could be my next move?

Thanks a lot,

Bart

-- 
Bart Jooris
Department of Information Technology
Internet Based Communication Networks and Services (IBCN)
Ghent University - iMinds
Gaston Crommenlaan 8 (Bus 201), B-9050 Gent, Belgium
E-mail: bart.jooris@intec.UGent.be
M: +32 474 59 53 42
Tel. +32 9 33 14900
Fax +32 9 33 14899


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
