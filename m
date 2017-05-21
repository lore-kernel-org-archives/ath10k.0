Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCIm4-0001l0-DA
 for ath10k@lists.infradead.org; Sun, 21 May 2017 04:47:26 +0000
Received: by mail-yw0-x231.google.com with SMTP id b68so48322215ywe.3
 for <ath10k@lists.infradead.org>; Sat, 20 May 2017 21:47:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1855b2ff-3ed0-a2c3-ad27-7971fa92ee98@rempel-privat.de>
References: <1fdab9d5-d8c6-88dc-38ac-2948e5fa74ec@rempel-privat.de>
 <CAMo8Bf+xbS46Kj4VP_+F2aZPZpOJ2UHV6WdHP_Ku_eaSQwm-7g@mail.gmail.com>
 <1855b2ff-3ed0-a2c3-ad27-7971fa92ee98@rempel-privat.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 20 May 2017 21:47:02 -0700
Message-ID: <CAMo8BfLxTU0PVUC+7FMjX9YOkmJ6+PEy09fFvC--HmvFNwyNvw@mail.gmail.com>
Subject: Re: Search for devices with Xtensa cores
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
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org

On Sat, May 20, 2017 at 4:02 AM, Oleksij Rempel <linux@rempel-privat.de> wrote:
> Am 16.05.2017 um 21:46 schrieb Max Filippov:
>> On Fri, Apr 28, 2017 at 11:23 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
>>> this year started with inclusion of open-ath9k-htc-firmware to debian
>>> *main* repository. As first we started to getting advantage of regular
>>> compile tests. See results here:
>>> https://tests.reproducible-builds.org/debian/rb-pkg/unstable/i386/open-ath9k-htc-firmware.html
>>>
>>> Most of the problems which we currently get, are related to gcc xtensa
>>> compiler.
>>> In details: device specific patch set is used to provide our own
>>> gcc/binutils version because Xtensa don't really have defined CPU cores.
>>> As result, upstream compiler developers will never notice if some thing
>>> will brake this patch set.
>>
>> Below are the links to the xtensa-dynconfig repository and xtensa-plugin-env
>> branches in binutils-gdb and gcc repositories. Together it is a draft
>> implementation of dynamically configurable xtensa toolchain.
>> Could you please take a look at it and see if it's useful for you?
>>
>> https://github.com/jcmvbkbc/xtensa-dynconfig
>> https://github.com/jcmvbkbc/binutils-gdb-xtensa/commits/xtensa-plugin-env
>> https://github.com/jcmvbkbc/gcc-xtensa/commits/xtensa-plugin-env
>
> I didn't tested it jet, but it looks promising. How can i itegrate this
> two patches?
> https://github.com/olerem/open-ath9k-htc-firmware/tree/master/local/patches

Apply binutils.patch to the binutils-2.26.1 and then copy
binutils/bfd/xtensa-modules.c
and binutils/include/xtensa-config.h into xtensa-dynconfig/config/<config-name>.
And since the gdb part is missing you'd need to create two empty c source files:
xtensa-dynconfig/config/<config-name>/gdb/gdb/{xtensa-config.c,xtensa-xtregs.c}

-- 
Thanks.
-- Max

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
