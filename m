Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGLvA-00066q-Fi
 for ath10k@lists.infradead.org; Mon, 02 Sep 2013 04:39:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath10k: check chip id from the soc register during
 probe
References: <20130901082007.1930.79088.stgit@localhost6.localdomain6>
 <20130901082214.1930.61079.stgit@localhost6.localdomain6>
 <201309011749.00846.chunkeey@googlemail.com>
Date: Mon, 2 Sep 2013 07:38:57 +0300
In-Reply-To: <201309011749.00846.chunkeey@googlemail.com> (Christian
 Lamparter's message of "Sun, 1 Sep 2013 17:48:59 +0200")
Message-ID: <87k3iz7s7y.fsf@kamboji.qca.qualcomm.com>
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Christian Lamparter <chunkeey@googlemail.com> writes:

> On Sunday 01 September 2013 10:22:14 Kalle Valo wrote:
>> ath10k doesn't support qca988x hw1.0 boards anymore. Unfortunately
>> the PCI id is the same in hw1.0 and hw2.0 so ath10k tries to use
>> hw1.0 boards anyway. But without hw1.0 workarounds in place
>> ath10k just crashes horribly.
>> 
>> To avoid using hw1.0 boards at all add a chip id detection
>> and fail the probe if hw1.0 is detected:
>> 
>> [ 5265.786408] ath10k: ERROR: qca988x hw1.0 is not supported
>> [ 5265.786497] ath10k: Unsupported chip id 0x043202ff
>
> Wait a second... Isn't "0x043202ff" the id for v2.0?
> Shouldn't this have worked?

Hehe, you catched me cheating now :)

Yesterday I was too lazy to switch to the v1 board I have, so I just
temporarily switched id definitions in hw.h but then forgot the hack
while copying the "screenshot". I'll change this in the commit log to
0x043000ff which it should have been. Good catch!

>
>> [ 5265.786574] ath10k: could not register driver core (-95)
>> [ 5265.793191] ath10k_pci: probe of 0000:02:00.0 failed with error -95
>> 
>> Also add a warning if there's an unknown chip id but continue
>> the boot process normally anyway.
>> 
>
> [22217.940000] ath10k_pci 0000:01:00.0: BAR 0: assigned [mem 0x12000000-0x121fffff 64bit]
> [22217.950000] PCI: Enabling device 0000:01:00.0 (0000 -> 0002)
> [22217.960000] ath10k: ERROR: qca988x hw1.0 is not supported
> [22217.960000] ath10k: Unsupported chip id 0x043200ff
> [22217.970000] ath10k: could not register driver core (-122)
> [22217.970000] ath10k_pci: probe of 0000:01:00.0 failed with error -122
>
> [ Ok. Although I wonder why the error code is -122 (-EDQUOT) and
> not -95 (-EOPNOTSUPP)?!

That is odd. I just rerun this (with the hw1.0 <-> hw2.0 id hack) and I
got the -95 error code. No idea what happened before.

So I will change the screenshot in commit log to this:

[   90.939484] ath10k: ERROR: qca988x hw1.0 is not supported
[   90.939663] ath10k: Unsupported chip id 0x043200ff
[   90.939818] ath10k: could not register driver core (-95)
[   90.952324] ath10k_pci: probe of 0000:02:00.0 failed with error -95

> Anyway, it still works. However I'm looking forward to run some more
> tests, but first I'll need to get that 2.0 hw ;-) ].

Indeed!

> Tested-by: Christian Lamparter <chunkeey@googlemail.com>

Thanks, I'll add that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
