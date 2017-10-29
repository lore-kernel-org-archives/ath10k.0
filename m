Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8hgm-0003GE-En
 for ath10k@lists.infradead.org; Sun, 29 Oct 2017 07:07:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k-regression in 4.14: Connections aborts with "failed to
 extract amsdu: -11"
Date: Sun, 29 Oct 2017 07:06:43 +0000
Message-ID: <87y3nu4em6.fsf@kamboji.qca.qualcomm.com>
References: <5a4860eb-3734-7587-d81f-9c3de6ff11c8@leemhuis.info>
 <46f918c5-b07d-e397-2f3d-8136c7c1a8f3@qti.qualcomm.com>
In-Reply-To: <46f918c5-b07d-e397-2f3d-8136c7c1a8f3@qti.qualcomm.com> (Ryan
 Hsu's message of "Mon, 2 Oct 2017 23:40:31 +0000")
Content-Language: en-US
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

+ linux-wireless

Ryan Hsu <ryanhsu@qti.qualcomm.com> writes:

>>> ath10k_pci 0000:3a:00.0: Direct firmware load for
>>> ath10k/pre-cal-pci-0000:3a:00.0.bin failed with error -2
>>> ath10k_pci 0000:3a:00.0: Direct firmware load for
>>> ath10k/cal-pci-0000:3a:00.0.bin failed with error -2
>> Do they have anything to do with this? Hardware is
>
> This error message is confusing since QCA6174 is not supporting
> pre-calibration feature, this reminds me that we need to clean this
> up.

These warnings come up again because of this commit:

c0cc00f250e1 ath10k: activate user space firmware loading again

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=c0cc00f250e19c717fc9cdbdb7f55aaa569c7498

We really need a function like request_firmware_nowarn() which would not
print a warning everytime a file is not found. It just confuses the
users and make them falsely believe that's the reason of their problems.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
