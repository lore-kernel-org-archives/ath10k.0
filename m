Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSBAt-0007hZ-51
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 20:41:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: support firmware crash-by-assert
References: <20140910155928.30418.45160.stgit@potku.adurom.net>
 <54107D90.7080907@candelatech.com>
Date: Thu, 11 Sep 2014 23:40:26 +0300
In-Reply-To: <54107D90.7080907@candelatech.com> (Ben Greear's message of "Wed, 
 10 Sep 2014 09:34:24 -0700")
Message-ID: <874mwd3n7p.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 09/10/2014 08:59 AM, Kalle Valo wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> 10.1 firmware does not have an official way to
>> cause assert on purpose, but it can be done with
>> carefully crafted WMI command.  This is a different
>> kind of crash from the 'hard' crash, which is
>> a bad memory dereference.
>>
>> Different crashes decode in different manners, so
>> this will help the crash-report testing as well as
>> offer better ways to test firmware failure and
>> recovery.
>>
>> kvalo: move the wmi command creation to debug.c, modify
>> the info print
>
> This looks fine to me.  I have not tested this version.

I did test it and seems to work as it should.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
