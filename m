Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vs14.mail.saunalahti.fi ([62.142.117.201])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuHuI-0006Xb-Tc
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 08:59:51 +0000
Message-ID: <5396C8EC.4090105@elisanet.fi>
Date: Tue, 10 Jun 2014 10:59:24 +0200
From: Matti Laakso <malaakso@elisanet.fi>
MIME-Version: 1.0
Subject: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org> <5396C39A.9080402@elisanet.fi>
 <87wqcpb0w1.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wqcpb0w1.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 10.06.2014 10:54, Kalle Valo wrote:
> Matti Laakso <malaakso@elisanet.fi> writes:
>
>>> a) Use platform data, like ath9k does.
>>>
>>> b) add a module option to ath10k, and let ath10k fetch the files via mtd 
>>> API.
>>>      Has the downside of requiring MTD (maybe add a config option to 
>>> disable that?),
>>>      but i like that more than the ath9k way of reading an arbitrary 
>>> memory region and
>>>      circumventing the MTD layer.
>>>
>>> Any thoughts? I can prepare a patch if needed.
>> There's yet another method: Use platform data to provide only a file
>> name and then use request_firmware to load it from a file under
>> /lib/firmware. Then it is up to the platform support code to get the
>> data there. This is used in OpenWrt by rt2x00 drivers.
> That's true. Now that you mention this, I remember that this was also
> suggested in linux-wireless list for wl1251 (a long time ago when I was
> still working on that driver). And there doesn't even need to a real
> file in the filesystem, it's possible to implement a udev script which
> does what it ever needs to feed the data to the kernel, be it reading
> from MTD partition or whatever.
>
> But why let the user name provide the file name? Why cannot it be a
> fixed name, like "cal.bin"?
>

If there are multiple WNICs each with its own calibration data?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
