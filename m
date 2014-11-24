Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xsu2O-0004zM-N5
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 13:50:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add the target register access and memory dump
 debugfs interface
References: <1416656922-6645-1-git-send-email-yanbol@qti.qualcomm.com>
Date: Mon, 24 Nov 2014 15:50:07 +0200
In-Reply-To: <1416656922-6645-1-git-send-email-yanbol@qti.qualcomm.com> (Yanbo
 Li's message of "Sat, 22 Nov 2014 19:48:42 +0800")
Message-ID: <871tos7lo0.fsf@kamboji.qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qti.qualcomm.com>
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, michal.kazior@tieto.com, ath10k@lists.infradead.org

Yanbo Li <yanbol@qti.qualcomm.com> writes:

> The debugfs interface reg_addr&reg_val used to read and write the target
> register.
> The interface mmem_val used to dump the targer memory and also can be
> used to assign value to target memory
>
> The basic usage explain as below:
>
> Register read/write:
> reg_addr       (the register address)                    (read&write)
> reg_value      (the register value,  output is ASCII)    (read&write)
>
> Read operation:
> 1. Write the reg address to reg_addr
>    IE:  echo 0x100000 > reg_addr
> 2. Read the value from reg_value
>    IE:  cat reg_value
> Write operation:
> 1. Write the reg address to reg_addr IE:  echo 0x100000 > reg_addr
> 2. Write the value to the reg_value  IE:  echo  0x2400 > reg_value
>
> Target memory dump:
> mem_value (the target memory, access with the length and start address
> 							(read&write)
> Read operation:
>
> 1: Read 4K(bs*count)) from address 0x400000(bs*skip)
> dd if=mem_value bs=4 count=1024 skip=1048576 | xxd -g1
>
> 2: Read 0x50000(bs*count) from address 0x400000(bs*skip)
> dd if=mem_value bs=4 count=81920 skip=1048576 | xxd -g1
>
> Write operation:
>
> 1: Write the 0x01020304 to address 0x400400(bs*seek)
> echo 0x01020304 | xxd -r | dd of=mem_value bs=4 seek=1048832
>
> 2: Read the memory and then write back after edit
> dd if=mem_value bs=4 count=1024 skip=1048576 > tmp.bin
> edit the tmp.bin
> dd if=tmp.bin of=mem_value bs=4 count=4 seek=1048576
>
> It suggests assign the 4 align number to bs, IE, 4, 8, 16 ....
> Cause the target memory width is 32bit
>
> Signed-off-by: Yanbo Li <yanbol@qti.qualcomm.com>

The commit log is quite hard to read due to formatting, but I can clean
that up.

> +	spin_lock_bh(&ar->data_lock);
> +	reg_addr = ar->debug.reg_addr;
> +	spin_unlock_bh(&ar->data_lock);

[...]

> +	spin_lock_bh(&ar->data_lock);
> +	ar->debug.reg_addr = reg_addr;
> +	spin_unlock_bh(&ar->data_lock);

[...]

> +	spin_lock_bh(&ar->data_lock);
> +	reg_addr = ar->debug.reg_addr;
> +	spin_unlock_bh(&ar->data_lock);

[...]

> +	spin_lock_bh(&ar->data_lock);
> +	reg_addr = ar->debug.reg_addr;
> +	spin_unlock_bh(&ar->data_lock);

I admit that I'm far from a locking expert, but does that make any
difference in the functionality?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
