Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUNFy-0002Hg-9l
 for ath10k@lists.infradead.org; Sun, 30 Mar 2014 21:27:07 +0000
Received: by mail-we0-f178.google.com with SMTP id u56so3912593wes.23
 for <ath10k@lists.infradead.org>; Sun, 30 Mar 2014 14:26:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <533881D6.9010301@intec.ugent.be>
References: <530BB3E2.8000705@intec.ugent.be>
 <87wqghkc9h.fsf@kamboji.qca.qualcomm.com>
 <533881D6.9010301@intec.ugent.be>
Date: Sun, 30 Mar 2014 14:26:44 -0700
Message-ID: <CAA93jw7xQ=CK7yBaZ6UHYAJO542uPd4QG7rFDmRoGrNe5KkgyA@mail.gmail.com>
Subject: Re: Compiling custom ath10k: step 5 minor issue
From: Dave Taht <dave.taht@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
Cc: ath10k@lists.infradead.org

On Sun, Mar 30, 2014 at 1:43 PM, Bart Jooris <bart.jooris@gmail.com> wrote:
> Hi all,
>
>
> On 02/26/2014 06:35 PM, Kalle Valo wrote:
>>
>> Bart Jooris <Bart.Jooris@intec.ugent.be> writes:
>>
>>> ../ath/net/core/flow_dissector.c seems to be changed?
>>>
>>> ./gentree.py --verbose --clean --git-revision master --copy-list
>>> copy-list.ath ../ath ../backports-output
>>> Get original source files from git ...
>>> Apply patches ...
>>> Not applying backport-adjustments/dma-buf.patch, not needed
>>> Applying patch backport-adjustments/flow_dissector.patch
>>>>
>>>> patching file compat/net-core-flow_dissector.c
>>>> Hunk #1 FAILED at 177.
>>>> 1 out of 1 hunk FAILED -- saving rejects to file
>>>
>>> compat/net-core-flow_dissector.c.rej
>>
>> backports is always a moving target and you might get errors like these
>> when you create it on your own. There really isn't a reliable to avoid
>> it, you just have to fix the errors as you see them.

The flow dissector recently had a crash bug fixed and there seem to be
multiple conflicts with how other back ports were done to older
versions of Linux.

I just ran into this problem myself on a back port to 3.4. Haven't
fully sorted it out.



> I needed one fix, in drivers_net_wireless_ath_wil6210_netdev.patch, to let
> all the hunks succeed. I ended up with gentree expecting combined.cocci i=
n a
> tempdir...
>
> ...
> Not applying
> collateral-evolutions/regulator/0001-bt8xx-rename-dst-ops.patch, not need=
ed
> Applying patch /tmp/Tgt2Ph/combined.cocci
> Traceback (most recent call last):
>   File "./gentree.py", line 843, in <module>
>     ret =3D _main()
>   File "./gentree.py", line 490, in _main
>     logwrite=3Dlogwrite)
>   File "./gentree.py", line 706, in process
>     cwd=3Dargs.outdir)
>   File "/usr/lib/python2.7/subprocess.py", line 709, in __init__
>     errread, errwrite)
>   File "/usr/lib/python2.7/subprocess.py", line 1326, in _execute_child
>     raise child_exception
> OSError: [Errno 2] No such file or directory
>
>
> What could be my next move?
>
> Thanks a lot,
>
>
> Bart
>
> --
> Bart Jooris
> Department of Information Technology
> Internet Based Communication Networks and Services (IBCN)
> Ghent University - iMinds
> Gaston Crommenlaan 8 (Bus 201), B-9050 Gent, Belgium
> E-mail: bart.jooris@intec.UGent.be
> M: +32 474 59 53 42
> Tel. +32 9 33 14900
> Fax +32 9 33 14899
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k



-- =

Dave T=E4ht

Fixing bufferbloat with cerowrt: http://www.teklibre.com/cerowrt/subscribe.=
html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
